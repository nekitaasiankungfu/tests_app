#!/usr/bin/env python3
"""
MCP сервер для поиска психологической информации на сайте APA (www.apa.org)
Используется для помощи в разработке приложения с психологическими тестами
"""

import asyncio
import json
from typing import Any, Dict, List, Optional
from urllib.parse import quote_plus, urljoin

import httpx
from bs4 import BeautifulSoup
from mcp.server import Server
from mcp.types import (
    Resource,
    Tool,
    TextContent,
    ImageContent,
    EmbeddedResource,
)
import mcp.server.stdio


# Константы
APA_BASE_URL = "https://www.apa.org"
APA_SEARCH_URL = f"{APA_BASE_URL}/search"
USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36"


class APASearchServer:
    """MCP сервер для работы с сайтом APA"""
    
    def __init__(self):
        self.server = Server("apa-search-server")
        self.http_client: Optional[httpx.AsyncClient] = None
        
        # Регистрация инструментов
        self.server.list_tools()(self.list_tools)
        self.server.call_tool()(self.call_tool)
        
    async def __aenter__(self):
        """Инициализация HTTP клиента"""
        self.http_client = httpx.AsyncClient(
            timeout=30.0,
            headers={"User-Agent": USER_AGENT},
            follow_redirects=True
        )
        return self
    
    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Закрытие HTTP клиента"""
        if self.http_client:
            await self.http_client.aclose()
    
    async def list_tools(self) -> List[Tool]:
        """Список доступных инструментов"""
        return [
            Tool(
                name="search_apa_site",
                description=(
                    "Поиск информации на сайте APA (American Psychological Association). "
                    "Используйте для поиска статей, исследований, теорий и методик по психологии. "
                    "Возвращает релевантные результаты с заголовками, описаниями и ссылками."
                ),
                inputSchema={
                    "type": "object",
                    "properties": {
                        "query": {
                            "type": "string",
                            "description": "Поисковый запрос (например: 'psychological tests', 'personality assessment', 'depression screening')"
                        },
                        "max_results": {
                            "type": "integer",
                            "description": "Максимальное количество результатов (по умолчанию: 10)",
                            "default": 10
                        }
                    },
                    "required": ["query"]
                }
            ),
            Tool(
                name="get_apa_page_content",
                description=(
                    "Получить полное содержимое конкретной страницы с сайта APA. "
                    "Используйте для детального изучения статьи, руководства или документа. "
                    "Извлекает текст, заголовки и основную информацию со страницы."
                ),
                inputSchema={
                    "type": "object",
                    "properties": {
                        "url": {
                            "type": "string",
                            "description": "Полный URL страницы на apa.org"
                        }
                    },
                    "required": ["url"]
                }
            ),
            Tool(
                name="search_apa_topics",
                description=(
                    "Поиск по конкретным темам/категориям APA. "
                    "Полезно для поиска информации в определенных разделах психологии "
                    "(например: clinical psychology, testing & assessment, mental health)."
                ),
                inputSchema={
                    "type": "object",
                    "properties": {
                        "topic": {
                            "type": "string",
                            "description": "Тема для поиска (например: 'testing and assessment', 'clinical psychology', 'mental health')"
                        },
                        "query": {
                            "type": "string",
                            "description": "Дополнительный поисковый запрос внутри темы"
                        }
                    },
                    "required": ["topic"]
                }
            ),
            Tool(
                name="get_apa_psychology_tests_info",
                description=(
                    "Получить информацию о психологических тестах и методиках оценки. "
                    "Ищет информацию о стандартизированных тестах, методах диагностики, "
                    "валидности и надежности инструментов."
                ),
                inputSchema={
                    "type": "object",
                    "properties": {
                        "test_type": {
                            "type": "string",
                            "description": "Тип теста (например: 'personality', 'intelligence', 'depression', 'anxiety')"
                        }
                    },
                    "required": ["test_type"]
                }
            )
        ]
    
    async def call_tool(self, name: str, arguments: Dict[str, Any]) -> List[TextContent]:
        """Вызов инструмента"""
        try:
            if name == "search_apa_site":
                return await self._search_apa_site(
                    arguments["query"],
                    arguments.get("max_results", 10)
                )
            elif name == "get_apa_page_content":
                return await self._get_page_content(arguments["url"])
            elif name == "search_apa_topics":
                return await self._search_apa_topics(
                    arguments["topic"],
                    arguments.get("query", "")
                )
            elif name == "get_apa_psychology_tests_info":
                return await self._get_psychology_tests_info(
                    arguments["test_type"]
                )
            else:
                return [TextContent(
                    type="text",
                    text=f"Неизвестный инструмент: {name}"
                )]
        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Ошибка при выполнении {name}: {str(e)}"
            )]
    
    async def _search_apa_site(self, query: str, max_results: int) -> List[TextContent]:
        """Поиск по сайту APA"""
        if not self.http_client:
            return [TextContent(type="text", text="HTTP клиент не инициализирован")]
        
        # Формируем URL поиска
        search_url = f"{APA_BASE_URL}/search?query={quote_plus(query)}"
        
        try:
            response = await self.http_client.get(search_url)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Ищем результаты поиска
            results = []
            
            # Разные варианты структуры страницы поиска
            search_results = (
                soup.find_all('div', class_=['search-result', 'result', 'search-item']) or
                soup.find_all('article') or
                soup.find_all('div', class_=lambda x: x and 'result' in x.lower())
            )
            
            for item in search_results[:max_results]:
                # Извлекаем заголовок
                title_tag = (
                    item.find('h2') or 
                    item.find('h3') or 
                    item.find('a', class_=lambda x: x and 'title' in str(x).lower())
                )
                title = title_tag.get_text(strip=True) if title_tag else "Без названия"
                
                # Извлекаем ссылку
                link_tag = item.find('a', href=True)
                link = ""
                if link_tag:
                    href = link_tag['href']
                    link = href if href.startswith('http') else urljoin(APA_BASE_URL, href)
                
                # Извлекаем описание
                description_tag = (
                    item.find('p') or 
                    item.find('div', class_=lambda x: x and ('description' in str(x).lower() or 'summary' in str(x).lower()))
                )
                description = description_tag.get_text(strip=True) if description_tag else ""
                
                if title and link:
                    results.append({
                        'title': title,
                        'link': link,
                        'description': description[:300] + "..." if len(description) > 300 else description
                    })
            
            # Если не нашли результаты стандартным способом, пробуем альтернативный метод
            if not results:
                # Ищем все ссылки на странице с релевантным текстом
                all_links = soup.find_all('a', href=True)
                for link_tag in all_links[:max_results]:
                    text = link_tag.get_text(strip=True)
                    href = link_tag['href']
                    
                    if len(text) > 10 and not href.startswith('#'):
                        link = href if href.startswith('http') else urljoin(APA_BASE_URL, href)
                        results.append({
                            'title': text,
                            'link': link,
                            'description': ''
                        })
            
            if not results:
                return [TextContent(
                    type="text",
                    text=f"По запросу '{query}' ничего не найдено на сайте APA. Попробуйте другие ключевые слова."
                )]
            
            # Форматируем результаты
            output = f"# Результаты поиска на APA.org по запросу: '{query}'\n\n"
            output += f"Найдено результатов: {len(results)}\n\n"
            
            for i, result in enumerate(results, 1):
                output += f"## {i}. {result['title']}\n"
                output += f"**Ссылка:** {result['link']}\n"
                if result['description']:
                    output += f"**Описание:** {result['description']}\n"
                output += "\n---\n\n"
            
            return [TextContent(type="text", text=output)]
            
        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Ошибка при поиске: {str(e)}\nURL: {search_url}"
            )]
    
    async def _get_page_content(self, url: str) -> List[TextContent]:
        """Получение содержимого страницы"""
        if not self.http_client:
            return [TextContent(type="text", text="HTTP клиент не инициализирован")]
        
        try:
            response = await self.http_client.get(url)
            response.raise_for_status()
            
            soup = BeautifulSoup(response.text, 'html.parser')
            
            # Удаляем скрипты, стили и навигацию
            for tag in soup(['script', 'style', 'nav', 'header', 'footer', 'aside']):
                tag.decompose()
            
            # Извлекаем заголовок
            title = soup.find('h1')
            title_text = title.get_text(strip=True) if title else "Без названия"
            
            # Извлекаем основной контент
            main_content = (
                soup.find('main') or 
                soup.find('article') or 
                soup.find('div', class_=lambda x: x and 'content' in str(x).lower())
            )
            
            if main_content:
                # Извлекаем все заголовки и параграфы
                content_parts = []
                for element in main_content.find_all(['h1', 'h2', 'h3', 'h4', 'p', 'li']):
                    text = element.get_text(strip=True)
                    if text:
                        if element.name in ['h1', 'h2', 'h3', 'h4']:
                            level = int(element.name[1])
                            content_parts.append(f"\n{'#' * level} {text}\n")
                        else:
                            content_parts.append(text)
                
                content = '\n\n'.join(content_parts)
            else:
                # Если не нашли основной контент, извлекаем весь текст
                content = soup.get_text(separator='\n', strip=True)
            
            # Ограничиваем длину
            if len(content) > 10000:
                content = content[:10000] + "\n\n...(содержимое обрезано, слишком длинное)"
            
            output = f"# {title_text}\n\n"
            output += f"**URL:** {url}\n\n"
            output += "---\n\n"
            output += content
            
            return [TextContent(type="text", text=output)]
            
        except Exception as e:
            return [TextContent(
                type="text",
                text=f"Ошибка при получении страницы: {str(e)}"
            )]
    
    async def _search_apa_topics(self, topic: str, query: str) -> List[TextContent]:
        """Поиск по конкретной теме"""
        # Формируем расширенный запрос
        search_query = f"{topic} {query}".strip()
        
        # Используем базовый поиск с дополнительной фильтрацией
        results = await self._search_apa_site(search_query, 15)
        
        # Добавляем информацию о теме
        if results and results[0].text:
            modified_text = f"# Поиск в категории: {topic}\n\n" + results[0].text
            return [TextContent(type="text", text=modified_text)]
        
        return results
    
    async def _get_psychology_tests_info(self, test_type: str) -> List[TextContent]:
        """Получение информации о психологических тестах"""
        # Формируем специфичный запрос для поиска тестов
        queries = [
            f"{test_type} psychological test assessment",
            f"{test_type} screening tool measure",
            f"{test_type} diagnostic instrument"
        ]
        
        all_results = []
        
        for query in queries:
            results = await self._search_apa_site(query, 5)
            if results and results[0].text:
                all_results.append(results[0].text)
        
        if not all_results:
            return [TextContent(
                type="text",
                text=f"Информация о тестах типа '{test_type}' не найдена. Попробуйте другой тип теста."
            )]
        
        # Объединяем результаты
        combined = f"# Информация о психологических тестах: {test_type}\n\n"
        combined += "\n\n---\n\n".join(all_results)
        
        return [TextContent(type="text", text=combined)]
    
    async def run(self):
        """Запуск сервера"""
        from mcp.server.stdio import stdio_server
        
        async with stdio_server() as (read_stream, write_stream):
            await self.server.run(
                read_stream,
                write_stream,
                self.server.create_initialization_options()
            )


async def main():
    """Главная функция"""
    async with APASearchServer() as server:
        await server.run()


if __name__ == "__main__":
    asyncio.run(main())


#!/usr/bin/env python3
"""
Тестовый скрипт для проверки работы MCP сервера APA Search
Запустите этот файл, чтобы убедиться, что все зависимости установлены корректно
"""

import sys
import asyncio


def check_dependencies():
    """Проверка установленных зависимостей"""
    print("Проверка зависимостей...")
    print("-" * 50)
    
    dependencies = {
        'mcp': 'MCP SDK',
        'httpx': 'HTTP клиент',
        'bs4': 'BeautifulSoup4',
        'lxml': 'lxml парсер'
    }
    
    missing = []
    
    for module, name in dependencies.items():
        try:
            __import__(module)
            print(f"✓ {name} установлен")
        except ImportError:
            print(f"✗ {name} НЕ установлен")
            missing.append(name)
    
    print("-" * 50)
    
    if missing:
        print(f"\n❌ Отсутствуют зависимости: {', '.join(missing)}")
        print("Установите их командой: pip install -r requirements.txt")
        return False
    else:
        print("\n✓ Все зависимости установлены!")
        return True


async def test_search():
    """Тест функции поиска"""
    print("\n" + "=" * 50)
    print("Тест функции поиска")
    print("=" * 50)
    
    try:
        import httpx
        from bs4 import BeautifulSoup
        
        print("Выполняется тестовый поиск на APA.org...")
        
        async with httpx.AsyncClient(timeout=10.0) as client:
            response = await client.get("https://www.apa.org")
            
            if response.status_code == 200:
                print(f"✓ Успешное подключение к APA.org (статус: {response.status_code})")
                
                soup = BeautifulSoup(response.text, 'html.parser')
                title = soup.find('title')
                
                if title:
                    print(f"✓ Страница загружена: {title.get_text()[:100]}")
                
                return True
            else:
                print(f"✗ Ошибка подключения (статус: {response.status_code})")
                return False
                
    except Exception as e:
        print(f"✗ Ошибка при тестировании: {str(e)}")
        return False


def check_python_version():
    """Проверка версии Python"""
    print("\nПроверка версии Python...")
    print("-" * 50)
    
    version = sys.version_info
    print(f"Версия Python: {version.major}.{version.minor}.{version.micro}")
    
    if version.major >= 3 and version.minor >= 10:
        print("✓ Версия Python подходит (требуется 3.10+)")
        return True
    else:
        print("✗ Требуется Python 3.10 или выше")
        return False


async def main():
    """Главная функция тестирования"""
    print("=" * 50)
    print("ТЕСТИРОВАНИЕ MCP СЕРВЕРА APA SEARCH")
    print("=" * 50)
    
    # Проверка версии Python
    python_ok = check_python_version()
    
    if not python_ok:
        print("\n❌ Тестирование не пройдено: неподходящая версия Python")
        return False
    
    # Проверка зависимостей
    deps_ok = check_dependencies()
    
    if not deps_ok:
        print("\n❌ Тестирование не пройдено: отсутствуют зависимости")
        return False
    
    # Тест подключения
    connection_ok = await test_search()
    
    print("\n" + "=" * 50)
    if python_ok and deps_ok and connection_ok:
        print("✅ ВСЕ ТЕСТЫ ПРОЙДЕНЫ УСПЕШНО!")
        print("=" * 50)
        print("\nСервер готов к использованию!")
        print("Запустите server.py для начала работы")
        return True
    else:
        print("❌ НЕКОТОРЫЕ ТЕСТЫ НЕ ПРОЙДЕНЫ")
        print("=" * 50)
        print("\nИсправьте ошибки перед использованием сервера")
        return False


if __name__ == "__main__":
    try:
        result = asyncio.run(main())
        sys.exit(0 if result else 1)
    except KeyboardInterrupt:
        print("\n\nТестирование прервано пользователем")
        sys.exit(1)
    except Exception as e:
        print(f"\n\n❌ Критическая ошибка: {e}")
        sys.exit(1)


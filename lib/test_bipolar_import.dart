import 'config/summary_config.dart';
import 'utils/app_logger.dart';

void testBipolarImport() {
  // Test 1: Check if getBipolarScale method exists
  final scale = SummaryConfig.getBipolarScale('personality_type_ei');
  appLogger.d('Scale found: ${scale?.id}');

  // Test 2: Check if BipolarScale type is available
  BipolarScale? testScale = scale;
  appLogger.d('Type check passed: ${testScale != null}');

  // Test 3: Check if scale IDs are available
  final ids = SummaryConfig.bipolarScaleIds;
  appLogger.d('Scale IDs: $ids');
}

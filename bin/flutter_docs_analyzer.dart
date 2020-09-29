import 'package:analyzer/file_system/physical_file_system.dart';
import 'package:analyzer/src/dart/analysis/driver.dart';
import 'package:analyzer/src/dart/analysis/performance_logger.dart';
import 'package:analyzer/src/dart/analysis/byte_store.dart';
import 'package:analyzer/src/dart/analysis/file_state.dart';
import 'package:analyzer/src/dart/sdk/sdk.dart';
import 'package:analyzer/src/context/source.dart';
import 'package:analyzer/src/generated/engine.dart';
import 'package:analyzer/src/generated/source.dart';

Future main(List<String> arguments) async {
  var log = PerformanceLog(null);
  var scheduler = AnalysisDriverScheduler(log);
  var options = AnalysisOptionsImpl();
  var resourceProvider = PhysicalResourceProvider.INSTANCE;
  var dartSdk = FolderBasedDartSdk(resourceProvider,
      resourceProvider.getFolder('/Users/ryjohn/code/lib/dart-sdk-2.9.3'));
  var resolvers = [
    // PackageWithoutSdkResolver(packageResolver, sdkResolver),
    DartUriResolver(dartSdk),
    // ResourceUriResolver(resourceProvider),
  ];
  var driver = AnalysisDriver(
    scheduler,
    log,
    resourceProvider,
    MemoryByteStore(),
    FileContentOverlay(),
    null,
    SourceFactoryImpl(resolvers),
    options,
  );
}

task :default => :test

desc "Clean"
task :clean do
  clean
end

desc "Build TestingTravis"
task :build do
  Rake::Task[:clean].invoke
  build
end

desc "Run Tests"
task :test do
  Rake::Task[:clean].invoke
  run_tests
end

private

def clean
  sh "xcodebuild -alltargets clean"
end

def build
  execute_xcodebuild
end

def run_tests
  execute_xcodebuild "test"
  tests_failed unless $?.success?
end

def execute_xcodebuild(build_action = "build")
  sh "xcodebuild -workspace TestingTravis.xcworkspace -scheme 'TestingTravis' -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6' -configuration Release #{build_action} | xcpretty -tc ; exit ${PIPESTATUS[0]}" rescue nil
end

def tests_failed
  puts red "TestingTravis tests failed"
  exit $?.exitstatus
end

def red(string)
  "\033[0;31m! #{string}"
end

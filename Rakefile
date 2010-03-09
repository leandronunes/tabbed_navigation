require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/packagetask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the tabbed_navigator plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the tabbed_navigator plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'TabbedNavigator'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

require 'lib/tabbed_navigator_meta'

Rake::PackageTask.new(TabbedNavigatorMeta.package, TabbedNavigatorMeta.version) do |p|
  p.need_tar_gz = true
  p.package_files.include('app/**/*')
  p.package_files.include('components/**/*')
  p.package_files.include('config/**/*')
  p.package_files.include('db/migrate/*')
  #p.package_files.include('doc/**/*')
  p.package_files.include('lib/**/*')
  p.package_files.include('locale/**/*')
  p.package_files.include('log')
  p.package_files.include('po/**/*')
  p.package_files.include('public/**/*')
  p.package_files.include('script/**/*')
  p.package_files.include('test/**/*')
  p.package_files.include('vendor/plugins/**/*')
  p.package_files.include('Rakefile')

  p.package_files.exclude('public/images/*.xcf')
  p.package_files.exclude('**/*~')
  p.package_files.exclude('**/.svn')
  p.package_files.exclude('config/database.yml')
  p.package_files.include('config/database.yml.dist')


end

# TODO: add documentation generation
task :dist => [ :clobber_package, :makemo, :package ] do
  puts "Finished generating package"
end

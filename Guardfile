guard :minitest, spring: 'bin/test', :all_on_start => true do
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})
  watch(%r{^test/test_helper\.rb$})
end

current_dir = "<PRJ_ROOT>/current"
before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', current_dir)
end

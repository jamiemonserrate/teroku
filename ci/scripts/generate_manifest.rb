#!/usr/bin/env ruby

require 'yaml'

manifest_yml = YAML.load_file "teroku/ci/manifest.yml"
manifest_yml["applications"][0]["name"] = ENV['APP_NAME']
File.write("generated-manifest.yml", manifest_yml.to_yaml)

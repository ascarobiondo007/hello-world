{
	// Place your snippets for ruby here. Each snippet is defined under a snippet name and has a prefix, body and 
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
	// same ids are connected.
	// Example:
	// "Print to console": {
	// 	"prefix": "log",
	// 	"body": [
	// 		"console.log('$1');",
	// 		"$2"
	// 	],
	// 	"description": "Log output to console"
	// }
}ruby -e "puts RUBY_VERSION"
require 'optionparser'
options = {}
printers = Array.new
OptionParser.new do |opts|
  opts.banner = "Usage: dfm [options] [path]\nDefaults: dfm -xd ." + File::SEPARATOR
  opts.on("-f", "--filters FILTERS", Array, "File extension filters") do |filters|
    options[:filters] = filters
  end
  opts.on("-x", "--duplicates-hex", "Prints duplicate files by MD5 hexdigest") do |dh|
    printers << "dh"
  end
  opts.on("-d", "--duplicates-name", "Prints duplicate files by file name") do |dh|
    printers << "dn"
  end
  opts.on("-s", "--singles-hex", "Prints non-duplicate files by MD5 hexdigest") do |dh|
    printers << "sh"
  end
  opts.on("-n", "--singles-name", "Prints non-duplicate files by file name") do |dh|
    printers << "sn"
  end
end.parse!
Usage: dfm [options] [path]
Defaults: dfm -xd ./
-f, --filters FILTERS 
-x, --duplicates-hex 
# Excerpt from https://github.com/leejarvis/slop
opts = Slop.parse do |o|
  o.string '-h', '--host', 'a hostname'
  o.integer '--port', 'custom port', default: 80
  o.bool '-v', '--verbose', 'enable verbose mode'
  o.bool '-q', '--quiet', 'suppress output (quiet mode)'
  o.bool '-c', '--check-ssl-certificate', 'check SSL certificate for host'
  o.on '--version', 'print the version' do
    puts Slop::VERSION
    exit
  end
end
ARGV #=> -v --host 192.168.0.1 --check-ssl-certificate
opts[:host]                 #=> 192.168.0.1
opts.verbose?               #=> true
opts.quiet?                 #=> false
opts.check_ssl_certificate? #=> true
opts.to_hash  #=> { host: "192.168.0.1", port: 80, verbose: true, quiet: false, check_ssl_certificate: true }
x = {"hello" => "world", this: {"apple" => 4, tastes: "delicious"}}
require 'json'
puts x.to_json
# {"hello":"world","this":{"apple":4,"tastes":"delicious"}}
puts JSON.pretty_generate( x )
# {
#   "hello": "world",
#   "this": {
#     "apple": 4,
#     "tastes": "delicious"
#   }

#!/usr/bin/env ruby

template = {
	"asm-function" => proc {|x| "#ifdef TEST\n.globl #{x}_\n#{x}_:\n#else\n.globl #{x}\n#{x}:\n#endif\n#ifdef __x86_64__\n\n#endif"}
}

exit unless template.keys.include?(ARGV[0])

puts template[ARGV[0]].call(ARGV[1])

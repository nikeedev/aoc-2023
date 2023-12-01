module main

import os

fn main() {
	if os.args.len < 2 {
		println("Issue! No input file path specified")
		exit(1)
	}

	mut lines := os.read_lines(os.args[1])!

	mut total := 0

	mut text := ''
	mut first := ''
	mut last := ''

	for i in 0 .. lines.len {
		text = lines[i]
		println(text)
		for j in 0 .. text.len {
			if first == '' {
				if text[j].is_digit() {
					first = text[j].ascii_str()
				}
			} else {
				if text[j].is_digit() {
					last = text[j].ascii_str()
				}
			}
		}

		println(first)
		println(last)

		if last == '' {
			last = first
		}

		println((first + last))
		total += (first + last).int()
		println(total)
		first = ''
		last = ''
	}

	println(total)
}

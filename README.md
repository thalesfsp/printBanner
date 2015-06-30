# printBanner

Prints the given text to the output/console with inverted colors options and vertical space control

## Basic usage
`printBanner [TEXT]` or `printBanner [OPTION] [TEXT]`

*Note: The [Text] should be double quoted*

## How to use?
- Directly in the terminal (including the source in your `.bash_profile` or `.bashrc` via `source printBanner.sh`)
	- `printBanner -t "Helo World"`
- Directly in the terminal (don't forget to `chmod a+x printBanner.sh`)
	- `sh printBanner -t "Hello World"`
	- `./printBanner -t "Hello World"`
- In your script (via `source printBanner.sh`)
	- `printBanner -t "Helo World"`

## Available Options

- `-t`, `--top`: add top vertical space
- `-b`, `--bottom`: add bottom vertical space
- `-tb`, `--top-bottom`: add top and bottom vertical space
- `-nvs`|`--no-vertical-space`: print the text without any vertical space
- `-h`, `--help`: display the help text
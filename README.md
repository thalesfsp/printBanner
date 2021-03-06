# printBanner

Since: 06/2015   
Author: Thales Pinheiro   
[![build status](http://ci.audaci.us:8072/projects/5/status.png?ref=master)](http://ci.audaci.us:8072/projects/5?ref=master)

## Abstraction

Prints the given text to the output/console with inverted colors options and vertical space control

![](https://s3-us-west-2.amazonaws.com/tfsp-printbanner/printBanner-example.png)

## Basic usage
`printBanner [TEXT]` or `printBanner [OPTION] [TEXT]`

*Note: The [Text] should be single quoted*

## How to use?

You can import **printBanner** (`source printBanner.sh`) into any script or use directly in the terminal, in this case you will need to source the script into your `.bash_profile` or `.bashrc` (it depends on the OS).

## Available Options

- `-t`, `--top`: add top vertical space
- `-b`, `--bottom`: add bottom vertical space
- `-tb`, `--top-bottom`: add top and bottom vertical space
- `-nvs`|`--no-vertical-space`: print the text without any vertical space
- `-h`, `--help`: display the help text

## Tests

Run `sh test.sh` or `./test.sh`.

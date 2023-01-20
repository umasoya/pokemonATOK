# pokemonATOK

ポケモンの名前をATOKの辞書にインポートできるように整形したテキストファイルを出力します。
<a href="https://pokeapi.co/" target="_blank">pokeAPI</a> を使用しています。

## Dependencies

- jq
    - Command-line JSON processor
- curl
    - transfer a URL
- uconv
    - convert data from one encoding to another

## Usage

```
./pokemonDictionaryGenerator.sh [options]
```

## Options

**-b**

bundle the output files to one.

**-c** string

*default: '固有一般'*

specify the part of speech for registration for ATOK.

**-d**

show debug messages.

**-f** integer

*default: 1*

start of the generation range.

**-o** string

*default: 'pokemon'*

specify the output filename.

**-t** integer

*default: (max number of the generations)*

end of the generation range.

**-v**

show verbose messages.

## Examples

### Output files by generation.

```sh
$ ./pokemonDictionaryGenerator.sh -f 2 -t 4
```

created `pokemon_gen2`,`pokemon_gen3` and `pokemon_gen4`.

### Output single file

```sh
$ ./pokemonDictionaryGenerator.sh -f 2 -t 4 -b
```

created `pokemon`.

### Output files by generation, specifying filenames.

```sh
$ ./pokemonDictionaryGenerator.sh -f 2 -t 4 -o output
```

created `output_gen2`,`output_gen3` and `output_gen4`.
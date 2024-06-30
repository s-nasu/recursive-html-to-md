## Project Name: Recursive HTML to Markdown Converter

### Description

This project consists of two scripts that work together to recursively search for HTML files in specified directories, convert their content to Markdown format, and add YAML front matter metadata. The first script searches for HTML files and saves their content to a directory. The second script adds YAML front matter to these files and converts them to Markdown format.

### Usage

1. **Run the first script `recursive_html_to_md.rb` to search for HTML files and save their content:**

2. **Run the second script `markdown_with_yaml.rb` to add YAML front matter and convert the content to Markdown format:**

### Requirements

- Ruby
- Nokogiri
- ReverseMarkdown
- Fileutils

Install the required gems using the following command:

```sh
bundle install
```

### Execution

1. Place the first script in a file, e.g., `recursive_html_to_md.rb`, and run it using:

```sh
ruby recursive_html_to_md.rb
```

2. Place the second script in a file, e.g., `markdown_with_yaml.rb`, and run it using:

```sh
ruby markdown_with_yaml.rb
```

---

## プロジェクト名: 再帰的なHTMLからMarkdownへのコンバーター

### 説明

このプロジェクトは、指定されたディレクトリ内のHTMLファイルを再帰的に検索し、その内容をMarkdown形式に変換して、YAMLフロントマターのメタデータを追加する2つのスクリプトで構成されています。最初のスクリプトはHTMLファイルを検索し、その内容をディレクトリに保存します。二番目のスクリプトはこれらのファイルにYAMLフロントマターを追加し、Markdown形式に変換します。

### 使用法

1. **最初のスクリプト `recursive_html_to_md.rb` を実行してHTMLファイルを検索し、その内容を保存します:**

2. **次に、二番目のスクリプト`markdown_with_yaml.rb`を実行してYAMLフロントマターを追加し、内容をMarkdown形式に変換します:**

### 要件

- Ruby
- Nokogiri
- ReverseMarkdown
- Fileutils

必要なgemをインストールするには、次のコマンドを実行してください:

```sh
bundle install
```

### 実行方法

1. 最初のスクリプトをファイルに保存します（例: `recursive_html_to_md.rb`）し、次のコマンドで実行します:

```sh
ruby recursive_html_to_md.rb
```

2. 次に、二番目のスクリプトをファイルに保存します（例: `markdown_with_yaml.rb`）し、次のコマンドで実行します:

```sh
ruby markdown_with_yaml.rb
```

これで、指定されたディレクトリ内のHTMLファイルをMarkdown形式に変換し、YAMLフロントマターを追加することができます。



# frozen_string_literal: true

require 'reverse_markdown'
require 'nokogiri'
require 'fileutils'

output_base_dir = '_posts_md'

# _postsディレクトリが存在する場合は削除
FileUtils.rm_rf(output_base_dir) if Dir.exist?(output_base_dir)

Dir.glob('_posts/*.md').each do |file|
  content = File.read(file)
  doc = Nokogiri::HTML(content)

  # <article>で囲まれた部分を取得
  article_content = doc.at('article').inner_html

  # タイトルを取得
  title = doc.at('.article-header h1').text.strip

  # 日付をファイル名から取得
  date = File.basename(file).match(/\d{4}-\d{2}-\d{2}/)[0]

  # タグを取得
  tags = doc.css('.meta a').map { |tag| tag.text.strip }

  # YAMLフロントマターを作成
  front_matter = "---\n"
  front_matter += "title: #{title}\n"
  front_matter += "date: #{date}\n"
  front_matter += "tags: #{tags}\n"
  front_matter += "categories: []\n"
  front_matter += "---\n\n"

  # Markdownに変換
  markdown_content = ReverseMarkdown.convert(article_content)

  # 元のコンテンツにYAMLフロントマターと<article>の内容を追加して保存
  new_content = front_matter + markdown_content

  # _post_metaディレクトリに保存
  output_file = File.join(output_base_dir, File.basename(file))
  FileUtils.mkdir_p(output_base_dir)
  File.write(output_file, new_content)
end

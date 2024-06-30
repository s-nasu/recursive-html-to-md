# frozen_string_literal: true

require 'find'
require 'nokogiri'
require 'reverse_markdown'
require 'fileutils'

# 入力ディレクトリ`input_dirs`内のHTMLファイルを再帰的に検索し、
# それぞれのファイルの内容を_postsディレクトリーに保存する

# 入力ディレクトリと出力ディレクトリのパスを設定
input_dirs = %w[2014 2015 2016]
output_base_dir = '_posts'

# _postsディレクトリが存在する場合は削除
FileUtils.rm_rf(output_base_dir) if Dir.exist?(output_base_dir)

# 指定されたディレクトリ内のHTMLファイルを再帰的に検索
input_dirs.each do |input_dir|
  Find.find(input_dir) do |path|
    next unless path =~ /.*\.html$/

    # HTMLファイルを読み込む
    html_content = File.read(path)

    # NokogiriでHTMLを解析
    doc = Nokogiri::HTML(html_content)

    main_content = doc.at('main')
    main_content.search('script', 'noscript', 'div#share-this').remove

    # 出力ファイルのパスを設定
    parent_dir = File.dirname(path)
    parent_dir_name = File.basename(parent_dir)

    output_file = File.join(output_base_dir, "#{parent_dir_name}.md")

    # 出力ディレクトリを作成
    FileUtils.mkdir_p(File.dirname(output_file))

    # Markdownを新しいファイルに保存
    File.open(output_file, 'w') do |file|
      file.write(main_content.inner_html)
    end

    puts "HTMLファイルを、#{output_file}に保存しました。"
  end
end

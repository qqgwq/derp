class AddImageUrlHtmlToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_url_html, :text
  end
end

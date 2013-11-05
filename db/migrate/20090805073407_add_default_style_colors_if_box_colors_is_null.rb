class AddDefaultStyleColorsIfBoxColorsIsNull < ActiveRecord::Migration
  def self.up
  #  Style.find(:all).each { |style| style.update_attribute :box_panel_background_color => "#FFF" if style.box_panel_background_color.empty? }
  end

  def self.down
  end
end
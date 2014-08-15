class Color < ActiveRecord::Base
  def to_hex
    "##{hex(red)}#{hex(green)}#{hex(blue)}"
  end

  def randomize
    %w{red green blue}.each do |component|
      write_attribute(component, Random.rand(256))
    end

    self
  end

  private

  def hex(val)
    val.to_i.to_s(16).rjust(2, '0')
  end
end

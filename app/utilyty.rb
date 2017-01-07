module Utility
  def present?
    !self.nil? && self.empty
  end
end
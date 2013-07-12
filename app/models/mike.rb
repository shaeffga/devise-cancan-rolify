class Mike < ActiveRecord::Base
  attr_accessible :complaining, :issue

  resourcify
  
end

class Trip < ActiveRecord::Base
  serialize :origin, ActiveRecord::Coders::Hstore
  serialize :destination, ActiveRecord::Coders::Hstore
  belongs_to :passenger
  belongs_to :driver

end

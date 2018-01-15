module AssignCodeBeforeValidation
  extend ActiveSupport::Concern

  included do
    before_validation do
      self.code = SecureRandom.uuid
    end
  end
end

module OmniauthAttributesConcern
    extend ActiveSupport::Concern
    module ClassMethods
        def twitter params
            (params['info']['email'] = "dummy#{SecureRandom.hex(10)}@dummy.com") if params['info']['email'].blank?
            attributes = {
                            email: params['info']['email'],
                            username: params['info']['name'],
                            password: Devise.friendly_token
                        }
            create(attributes)
        end
        def facebook params
            (params['info']['email'] = "dummy#{SecureRandom.hex(10)}@dummy.com") if params['info']['email'].blank?
            attributes = {
                            email: params['info']['email'],                            
                            username: params['info']['name'],
                            password: Devise.friendly_token,
                        }
            create(attributes)
        end  
    end
end
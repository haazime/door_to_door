require 'delegate'

module DoorToDoor
  class Route < SimpleDelegator

    def request(receiver)
      receiver.send(verb_method, action)
    end

    def controller_class
      controller_name.constantize
    end

    private

      def controller_name
        controller.camelize + 'Controller'
      end

      def verb_method
        verb.downcase
      end
  end
end

module ActiveFilter

  class Base
    attr_accessor :obj

    def method_missing(method, *args, &block)
      if obj.respond_to? method
        obj.send(method, *args, &block)
      else
        super
      end
    end
  end

  class MethodGenerator
    def initialize(name)
      @original_method = name
      @new_name = :"_wrapper_for_#{name}_#{Time.now.to_i}_"
    end

    def get
      @new_name
    end

    def original_method
      @original_method
    end
  end

  class Wrapper

    def initialize(original_method, klass, wrapper_klass)
      @original_method = original_method
      @wrapper_klass   = wrapper_klass
      @klass           = klass
      @wrapped         = false
      @mg = MethodGenerator.new(@original_method) 
      wrap!
    end

    def method
      @mg.get
    end

    def wrap!
      mg = @mg
      wrapper = @wrapper_klass.new

      @klass.class_eval do

        define_method mg.get do
          wrapper.obj = self

          wrapper.perform do
            send(mg.original_method)
          end
        end
      end
    end

  end

  module ClassMethods
    def wrapper_for(name, wrapper_klass)
      ActiveFilter::Wrapper.new(name, self, wrapper_klass)
    end

    def wrapped_before_filter(*names, &blk)
      _insert_callbacks(names, blk) do |name, options|
        method = options[:with] ? ActiveFilter::Wrapper.new(name, self, options[:with]).method : name
        set_callback :process_action, :before, method, options
      end
    end
  end

end

ActionController::Base.send :extend, ActiveFilter::ClassMethods

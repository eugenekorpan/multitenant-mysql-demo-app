module CallbacksPatch

  class FilterWrapper
    def initialize(original_method, klass)
      @original_method = original_method
      @klass         = klass
      @wrapped       = false
      wrap!
    end

    def method
      @name ||= "before_or_404_#{Time.now.to_i}_#{@original_method}"
    end

    def wrap!
      return @wrapped if @wrapped

      @klass.class_eval %Q{
        def #{method}
          begin
            #{@original_method}
          rescue
            render 'public/404', status: 404
          end
        end
      }
      @wrapped = true
    end
  end

  def before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      wrapper = FilterWrapper.new(name, self)
      set_callback :process_action, :before, wrapper.method, options
    end
  end

  def prepend_before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      wrapper = FilterWrapper.new(name, self)
      set_callback(:process_action, :before, wrapper.method, options.merge(:prepend => true))
    end
  end

  def skip_before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      wrapper = FilterWrapper.new(name, self)
      skip_callback(:process_action, :before, wrapper.method, options)
    end
  end

end

ActionController::Base.send :extend, CallbacksPatch

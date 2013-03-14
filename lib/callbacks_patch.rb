module CallbacksPatch

  def before_or_404(*names, &blk)
    _insert_callbacks(names, blk) do |name, options|
      callback_name = "before_or_404_#{name}"
      self.class_eval %Q{
      def #{callback_name}
        begin
      #{name}
        rescue
          render 'public/404', status: 404
        end
      end
      }
      set_callback :process_action, :before, callback_name, options
    end
  end

end

ActionController::Base.send :extend, CallbacksPatch

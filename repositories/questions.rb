module CUC
  class Questions
    class << self
      def batch_insert(arr)
        db.multi_insert(arr)
      end

      def random(number)
        db.all.sample(number)
      end

      private

      def db
        CUC::DB[:questions]
      end
    end
  end
end
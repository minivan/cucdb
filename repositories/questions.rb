module CUC
  class Questions
    class << self
      def batch_insert(arr)
        db.multi_insert(arr)
      end

      def random(number)
        db.all.sample(number)
      end

      def search(terms)
        search_terms = terms.map { |t| "%#{t}%"}
        db.grep(:text, search_terms, case_insensitive: true, all_patterns: true)
      end

      def destroy_all
        db.delete
      end

      private

      def db
        CUC::DB[:questions]
      end
    end
  end
end
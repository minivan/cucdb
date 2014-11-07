module CUC
  class Questions
    class << self
      def batch_insert(arr)
        db.multi_insert(arr)
      end

      def random(number)
        db.all.sample(number)
      end

      def search(terms, options={})
        search_terms = prepare_search_terms(terms)
        db.grep(:text, search_terms, case_insensitive: true, all_patterns: true)
      end

      def destroy_all
        db.delete
      end

      def count
        db.count
      end

      private

      def prepare_search_terms(terms)
        terms.map { |t| "%#{t}%"}
      end

      def db
        CUC::DB[:questions]
      end
    end
  end
end
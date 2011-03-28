module BQ
  class Table
    class << self
      def create(table, schema)
        url = "https://www.googleapis.com/bigquery/v1/tables"

        data = {
          :method => 'bigquery.tables.insert',
          :data => {:name => table, :fields => schema}
        }
        result = BQ.request(:post, data.to_json, url)

        return result
      end

      def delete(table)
        url = "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape(table)}"

        data = {
          :method => 'bigquery.tables.delete',
          :params => {:name => table}
        }

        result = BQ.request(:delete, data.to_json, url)

        return result
      end
    end
  end
end

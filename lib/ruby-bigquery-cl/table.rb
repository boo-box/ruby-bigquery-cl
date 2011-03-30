module BQ

  # This class can be used to create and delete tables.

  class Table
    class << self
      # Create a new table. Call this class method with the name of the table
      # and one shema array with collumns hashes following this example:
      #
      #   schema = [
      #     {:id" => "name", :type => "string", :mode => "REQUIRED"},
      #     {:id" => "age", :type => "integer"},
      #     {:id" => "weight", :type => "float"},
      #     {:id" => "is_magic", :type => "boolean"}
      #   ]
      #
      # A hash is returned with the API response.
      def create(table, schema)
        url = "https://www.googleapis.com/bigquery/v1/tables"

        data = {
          :data => {:name => table, :fields => schema}
        }

        # Send table creation request
        result = BQ.request(:post, data.to_json, url)

        return result
      end

      # Delete table. This class method never fails!
      # A hash is returned with the API response.
      def delete(table)
        # Encode destination table name
        url = "https://www.googleapis.com/bigquery/v1/tables/#{CGI.escape(table)}"

        # Send table deletetion request
        result = BQ.request(:delete, {}.to_json, url)

        return result
      end
    end
  end
end

module BigQuery

  # This can be used to send a query.

  class Query

    # This method execute a query in a table.
    # Call this method with a "query_string" like:
    # "SELECT count(*) from [examplebucket/tables/ponylist] WHERE is_magic = true;"
    # A hash is returned with the API response.
    def execute(sql)
      # Add a ";" if it's missing
      sql += ";" if not sql.end_with?(';')

      # Use a remote procedure call (RPC) to query
      data = {:params => {:q => sql}, :method => 'bigquery.query'}

      # Result a query request
      return BigQuery.request(:post, data.to_json)
    end
  end
end

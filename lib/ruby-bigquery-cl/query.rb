module BQ
  class Query

    def execute(sql)
      # adicionando o ; no final da linha caso nao tenha sido
      sql += ";" if not sql.end_with?(';')

      # URL
      data   = {:params => {:q => sql}, :method => 'bigquery.query'}

      # response from google
      result = BQ.request(:post, data.to_json)

      return result
    end

  end
end

defmodule KV.Bucket do
  @doc """
  Starts a new bucket.
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`.
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Stores a `value` in the `bucket` by a `key`.
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Deletes a `key` from the `bucket` and returns its `value`.
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, fn(dict) ->
      Map.pop(dict, key)
    end)
  end
end

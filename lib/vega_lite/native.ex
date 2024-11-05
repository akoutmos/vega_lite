defmodule VegaLite.Native do
  @moduledoc false

  mix_config = Mix.Project.config()
  version = mix_config[:version]
  github_url = mix_config[:package][:links]["GitHub"]

  use RustlerPrecompiled,
    otp_app: :vega_lite,
    crate: "ex_vl_convert",
    version: version,
    base_url: "#{github_url}/releases/download/v#{version}",
    targets:
      Enum.uniq(["aarch64-unknown-linux-musl" | RustlerPrecompiled.Config.default_targets()]),
    force_build: System.get_env("VEGA_LITE_BUILD") in ["1", "true"]

  # TODO: Implement the rest of these

  # Vega related NIF functions
  # def vega_to_html(), do: :erlang.nif_error(:nif_not_loaded)
  # def vega_to_jpeg(), do: :erlang.nif_error(:nif_not_loaded)
  # def vega_to_pdf(), do: :erlang.nif_error(:nif_not_loaded)
  # def vega_to_png(), do: :erlang.nif_error(:nif_not_loaded)
  # def vega_to_svg(), do: :erlang.nif_error(:nif_not_loaded)
  # def vega_to_scenegraph(), do: :erlang.nif_error(:nif_not_loaded)

  # VegaLite related NIF functions
  # def vegalite_to_html(), do: :erlang.nif_error(:nif_not_loaded)
  # def vegalite_to_jpeg(), do: :erlang.nif_error(:nif_not_loaded)
  # def vegalite_to_pdf(), do: :erlang.nif_error(:nif_not_loaded)
  # def vegalite_to_png(), do: :erlang.nif_error(:nif_not_loaded)
  def vegalite_to_svg(_vl_json_spec), do: :erlang.nif_error(:nif_not_loaded)
  # def vegalite_to_scenegraph(), do: :erlang.nif_error(:nif_not_loaded)

  # Conversion related NIF functions
  # def vegalite_to_vega(), do: :erlang.nif_error(:nif_not_loaded)
end
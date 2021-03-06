[back to resource list](https://github.com/sous-chefs/grafana#resources)

---

# grafana_config_panels

Configures the core panels section of the configuration <http://docs.grafana.org/installation/configuration/#panels>

Introduced: v4.0.0

## Actions

`:install`

## Properties

| Name                      | Type          |  Default                    | Description                                                               | Allowed Values
| ------------------------- | ------------- | --------------------------- | ------------------------------------------------------------------------- | --------------- |
| `enable_alpha`            | true, false   | `false`                     | Set to true if you want to test panels that are not yet ready for general usage.| true, false

## Examples

```ruby
grafana_config_panels 'grafana'
```

```ruby
grafana_config_panels 'grafana' do
  enable_alpha true
end
```

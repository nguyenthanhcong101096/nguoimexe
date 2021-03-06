---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - http

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction
This API documentation is about Người Mê Xe internal APIs.

# Authentication

> To authorize, use this code:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

# Provinces

## Get All Cities with Province


> The above command returns JSON structured like this:

```json
{
  "name": "Đà nẵng",
  "cities": [
    {"id": 79, "name": "Quận sơn trà"},
    {"id": 79, "name": "Quận linh chiểu"}
  ]
}
```

This endpoint retrieves all city

### HTTP Request

`GET http://example.com/api/v1/provinces/:id`

### Query Parameters

Parameter | Description
--------- | -----------
id | id of province

# Filter Posts
## Filter
> The above command returns JSON structured like this:

```json
{
  "block": "<h1>example</h1>",
  "meta": {
    "next_page": 1,
    "type_format": "json"
  }
}
```
This endpoint retrieves filter posts

### HTTP Request

`GET http://example.com/sales`

### Query Parameters

Parameter | Description
--------- | -----------
type | kind of vehicle
city_id | id of ciy
type_format | json or html
price_min | min price 
price_max | max price
sort | sort with price or created date

# Brand & Models Vehicle
## Show Brand
> The above command returns JSON structured like this:

```json
  {
    "name": "bike",
    "brands": [
      { "id": 24, "Bike sport" },
      { "id": 25, "Electric Bicycle" }
    ]
  }
```
### HTTP Request

`GET http://localhost:5000/api/v1/vehicle_kinds/:id`

### Query Parameters

Parameter | Description
--------- | -----------
id | id of vehicle of kind

## Show models of brand vehicle
> The above command returns JSON structured like this:

```json
  {
  "id": 1,
  "name": "Honda",
  "vehicle_models": [
    {
      "id": 1,
      "name": "Vision"
    },
    {
      "id": 2,
      "name": "sh"
    },
    {
      "id": 3,
      "name": "Cub"
    },
    {
      "id": 4,
      "name": "Air Blade"
    },
    {
      "id": 5,
      "name": "Lead"
    },
    {
      "id": 6,
      "name": "Dream"
    },
    {
      "id": 7,
      "name": "Wave"
    },
    {
      "id": 8,
      "name": "SH Mode"
    },
    {
      "id": 9,
      "name": "Future"
    },
    {
      "id": 10,
      "name": "Winner"
    },
    {
      "id": 11,
      "name": "Other"
    }
  ]
}

```

### HTTP Request

`GET http://localhost:5000/api/v1/brands/:id`

### Query Parameters

Parameter | Description
--------- | -----------
id | id of brand vehicle

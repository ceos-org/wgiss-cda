# Terms, definitions and abbreviated terms

## Terms and definitions

For the purposes of this document, the following terms and definitions apply:

```{glossary}

client
	A software component that can invoke an operation from a server

CMR
	The Common Metadata Repository is the database system used to manage earth science metadata records for the IDN.

collection
	A collection is an aggregation of granules sharing the same product specification. A collection typically corresponds to the series of products derived from data acquired by a sensor on board a satellite and having the same mode of operation.

data clearinghouse
    The collection of institutions providing digital data, which can be searched through a single
    interface using a common metadata standard

dataset
	Has the same meaning as collection

GCMD Keywords
	The Global Change Master Directory (GCMD) Keywords are a hierarchical set of controlled
	Earth Science vocabularies that help ensure Earth science data, services, and variables are
	described in a consistent and comprehensive manner and allow for the precise searching of
	metadata and subsequent retrieval of data, services, and variables.

granule
	The smallest aggregation of data that can be independently managed (described, inventoried,
	and retrieved). Granules have their own metadata model and support values associated with
	the additional attributes defined by the owning collection.  A granule usually matches the individual file of EO satellite data.

Granule Gateway
	A CEOS OpenSearch compliant server providing access to remote data partner inventory
	systems.

granule ID
	A character string that uniquely identifies a single granule to a granule gateway

identifier
	A character string that may be composed of numbers and characters that is exchanged between
	the client and the server with respect to a specific identity of a resource

Interface
	Named set of operations that characterize the behavior of an entity.

IDN
	The CEOS International Directory Network (IDN) is a gateway to earth science data and
	services.

IDN collection ID
	Unique collection identifier in IDN, returned from the IDN in response to the OSDD request.
	This identifier is assigned by the IDN CMR database.

Metadata
	Information about a resource.

native ID
	Collection identifier used by CWIC and FedEO to retrieve granule metadata through data
	provider API. This identifier is assigned by the data provider but may be the same as the CMR
	collection ID.

operation
	The specification of a transformation or query that an object may be called to execute

profile
	A set of one or more base standards and - where applicable - the identification of chosen
	clauses, classes, subsets, options and parameters of those base standards that are necessary for
	accomplishing a particular function

request
	The invocation of an operation by a client

response
	The result of an operation, returned from server to client

```

## Acronyms

```{glossary}

API
	Application Programming Interface

ARD
	Analysis Ready Data 

CMR
	Common Metadata Repository

CQL
	Common Query Language

GCMD
	Global Change Master Directory

IDN
	International Directory Network

JSON
	JavaScript Object Notation

OSDD
	OpenSearch Description Document

STAC
	Spatiotemporal Asset Catalog 

```

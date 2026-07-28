# Before You Begin

This chapter introduces the background, concepts and architecture of IDN, CWIC/CMR, and
FedEO, within the scope of the WGISS Connected Assets. The related skills you will need as a
client partner are also discussed.

## WGISS Connected Data Asssets Background

For scientists who conduct multi-disciplinary research, there may be a need to search multiple
catalogs in order to find the data they need. Such work can be very time-consuming and tedious,
especially when different catalogs may use different metadata models and catalog interface
protocols. It would be desirable, therefore, for those catalogs to be integrated into a catalog
federation which will present a well-known and documented metadata model and interface
protocol to users and hide the complexity and diversity of the affiliated catalogs behind the
interface. With such a federation, users only need to work with the federated catalog through the
public interface or API to find the data they need instead of working with various catalogs
individually.

The Committee on Earth Observation Satellites (CEOS) addresses coordination of the satellite
Earth Observation (EO) programs of the world's government agencies, along with agencies that
receive and process data acquired remotely from space. The Working Group on Information
Systems and Services (WGISS) is a subgroup of CEOS, which aims to promote collaboration in
the development of systems and services that manage and supply EO data to users world-wide.

NASA's contributions to the Committee on Earth Observation Satellites (CEOS) International
Directory Network (IDN) provides access to more than 50,000 Earth science data set and service
descriptions (stored in the Common Metadata Repository [CMR]) which cover subject areas
within Earth and environmental sciences. The IDN’s mission is to assist researchers, policy makers,
and the public in the discovery of and access to data and related services relevant to Earth science
research.

To aid in the search and discovery effort, Global Change Master Directory (GCMD) controlled
keywords have been developed and are regularly being refined and expanded. These keywords are
also used in other applications within the broader scientific community. Users may perform
searches through the IDN website and OpenSearch API using the controlled keywords, free-text
searches, map/date searches, or any combination of the above; and may also search or refine a
search by data center, instrument, platform, project, or temporal/spatial resolution.

The IDN also supports draft Metadata Management Tool (dMMT), a web-based metadata
authoring tool that allows metadata authors to add (or modify) data set descriptions that comply
with the CMR Unified Metadata Model for Collections (UMM-C). The tool also allows metadata
authors to validate and submit their metadata records directly for discovery in the IDN.

The CEOS WGISS Integrated Catalog (CWIC) is a collection of WGISS data partners which
supports data discovery from multiple EO data centers through the NASA CMR system. CWIC
was initiated and initially supported by NASA, NOAA, and USGS as a contribution to CEOS.
CWIC functionality was migrated to NASA’s Common Metadata Repository (CMR) in April 2021.
To achieve this, CWIC data partners adopted and implemented the recommended WGISS
interoperable standards and NASA evolved the architecture by allowing data partners to manage
their underlying connections to CWIC with the support of the WGISS System Level Team. CMR
provides inventory search to WGISS agency catalog systems for EO data by distributing search
requests to the appropriate server and sending search responses back to the requesting client.

FedEO (Federated Earth Observation Gateway) provides a unique entry point to a growing number
of scientific catalogues and services for, but not limited to, EO European and Canadian
missions. FedEO is deployed with ESA (European Space Agency) infrastructure as a gateway to 
provide brokered discovery, access and ordering capability to European/Canadian EO missions
data based on HMA (Heterogeneous Missions Accessibility) interfaces.

WGISS is coordinating efforts to connect CWIC and FedEO system with the IDN through a
common registration of metadata records to seamlessly provide search results for relevant data sets
regardless of which system is used to access the granule level data.

![Connected Data Assets](http://ceos.org/wp-content/uploads/2024/07/CDA_figure.png "Connected Data Assets")


## Search Concept and Design

A two-step collection/granule search process, which separates discovery of collections from
searching within relevant collections to retrieve specific data granules, has been adopted to realize
the integrated access to heterogeneous, autonomous data sources.
The WGISS Connected Data Assets system is an implementation of this two-step process. The
IDN provides an OpenSearch front end to the collection search. The response from the collection
search includes links to the OpenSearch Descriptor Documents (OSDD) at one of several Granule
Gateways, providing search capability for granules at the relevant data providers. Current WGISS
Connected Data Assets Granule Gateways include the CWIC data partners under CMR and FedEO.
Each of these systems provides access to different data archive systems using the same OpenSearch
protocol. Spatial and temporal metadata are the only attributes guaranteed to be supported at all
data providers. The CEOS OpenSearch Best Practice supports a number of metadata attributes
through the Parameter extensions, but they are not all universally supported across CWIC/CMR
or FedEO.

### Granule Search Criteria

Section 5 (below) gives complete details about the OpenSearch API for specifying search criteria.
It is important to understand how the OSDD documents search parameters both for collections and,
separately, for granules.

The step 2 search, i.e. granule search, supports constraints with spatial, temporal, and pagination.
Spatial constraint is specified with a bounding box. Temporal filter can be specified with begin
and end time in standard ISO 8601 timestamp format. See Section 5 for specific query parameters.

### Current Data Partners

Current data partners providing granule search access through WGISS Connected Data Assets
include systems from the various agencies shown in Figure 1. WGISS maintains a current list of
the data providers that comprise the WGISS Connected Data Assets on the WGISS website
https://ceos.org/ourwork/workinggroups/wgiss/access/connected-data-assets/.


## WGISS Architecture for Connected Data Assets

At its core, the systems present to End Users and Clients an OpenSearch server compliant with the
CEOS OpenSearch Best Practice. In this way, outside clients need to have no specific knowledge
of the particular partner data systems and communicate only via OpenSearch.

## Skills You Will Need as a Client Partner

As a Client Data Partner, you need to be familiar with basic web application technology such as:

* XML and [XML Schema](https://www.w3.org/TR/xmlschema-0/) (XSD)
* OpenSearch related technologies
* [RESTFul](https://en.wikipedia.org/wiki/Representational_state_transfer) related architecture and technologies
* Web development programming language


## WGISS Contact Information

All the documents and information about WGISS Connected Data Assets are available at WGISS
at https://ceos.org/ourwork/workinggroups/wgiss/access/

Any questions regarding to WCDA, please send the email to

* Access-SysTeam-help@wgiss.ceos.org














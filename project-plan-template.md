# Project plan

## Objective

The objective of this project is to retrieve past and current Olympic information including results, medals, athletes,etc. The data stores in data warehouses (raw, staging, marts) and data models are built in production environment ready to use for analytics. 



## Consumers

The users of our datasets are Data Analysts in different countries and Olympians all around world.

## Questions

What questions are you trying to answer with your data? How will your data support your users?

Example:

> - Which countires won most medals in passing five years?
> - Followed with the questions above, which types of sports do these countries dominate?
> - In recent five years, how many athletes break the world records? Who are they?


## Source datasets

The data is from Olympic sports API (olympic-sports-api.p.rapidapi.com). It includes Live Olympic results, Athlete info, Past Olympic records, Medal counts, Event schedules, etc.

Example:

| Source name | Source type | Source documentation |
| - | - | - |
| Customers database | PostgreSQL database | - |
| Orders API | REST API | - |

## Solution architecture

How are we going to get data flowing from source to serving? What components and services will we combine to implement the solution? How do we automate the entire running of the solution?

- What data extraction patterns are you going to be using?
- What data loading patterns are you going to be using?
- What data transformation patterns are you going to be performing?

We recommend using a diagramming tool like [draw.io](https://draw.io/) to create your architecture diagram.

Here is a sample solution architecture diagram:

![images/sample-solution-architecture-diagram.png](images/sample-solution-architecture-diagram.png)

## Breakdown of tasks

How is your project broken down? Who is doing what?

We recommend using a free Task board such as [Trello](https://trello.com/). This makes it easy to assign and track tasks to each individual.

Example:

![images/kanban-task-board.png](images/kanban-task-board.png)

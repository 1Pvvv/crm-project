# CRM Pet Project
Pet project for practice in writing Python code, using relevant frameworks and libraries. Also working with docker and using DBMS for storage via ORM system

# Architecture
This project is a CRM system built with Django and uses a Telegram bot for user interaction. Celery is used for background tasks, and Redis is used as a message broker.
Below is a block diagram illustrating the interaction between the system's components:

![plantuml_architecture_schema](https://cdn-0.plantuml.com/plantuml/dpng/TP0nSy8m38Lt_mgLYGvSzmuz4Z9sA90UiuX5S1FRgMMtnx-l4kV8CNJ9nNwVzDxpbYE6c6oldkALB44WhGCnRpI6JWuAK_GksJC5fR29Fi0do_yWOwOn0xe8gvfwQWDQA7rS0JBKvIDGVQ5hFPpe3CKmzAR1QBoRqEfKgEz4YM1r86qOrcNm7ONdIPsk7dVjn2pS1CEcQuDFJaEDt74UoAhI6F6CB4i_FCSsq77_3clv57qZFMyPhagbnZQmsRn9PdY58pazkaeYZagkHaKYtgK9ttbhqMcbHCd4E7iWrFno2YQIh9O0TpaNcrTCQI5ws8-jbSgYO7DsuIhgpG-56Rq4RsSu4ujbqJJ4dEroNtC1HwH9p-n__WVYrCSbHaQMjak4XLxwrhal3zunpS-KdqPChlvtqRPYcMp_1m00)

# System Components
1. User: The user interacts with the system through a Telegram bot, sending requests to manage CRM data.
2. Telegram Bot: The bot receives commands from the user and forwards them to the server where the Django application resides.
3. Django Web Application: The core web application that handles requests, interacts with the database, and triggers background tasks via Celery.
   * Django uses SQLAlchemy to interact with the PostgreSQL database.
   * It communicates with Redis to enqueue background tasks.
4. Redis (Broker): Redis serves as the broker for storing and forwarding tasks from Django to Celery. Django sends tasks to the Redis queue, and Celery picks them up for processing.
5. Celery (Background Tasks): Celery executes background tasks, such as data processing or sending notifications. Tasks are sent to Celery through Redis.
6. PostgreSQL (SQLAlchemy): This is the relational database where all CRM data is stored. Django interacts with PostgreSQL through SQLAlchemy for reading and writing data.

# Workflow
1. The user sends a request via the Telegram bot.
2. The bot forwards the command to the Django application.
3. Django processes the request and interacts with the database to read or write data.
4. If the request requires background processing, Django sends a task to the Redis queue.
5. Redis forwards the task to Celery for execution.
6. Celery may interact with the database if necessary to complete the task.
7. Once the task is completed, the result is sent back to Django via Redis.
8. Django returns the result to the Telegram bot, which then displays the response to the user.

# Technologies
- Django — The core web application framework.
- SQLAlchemy — ORM for interacting with PostgreSQL.
- PostgreSQL — Relational database used to store CRM data.
- Telegram Bot — Interface for user interaction.
- Celery — System for executing background tasks.
- Redis — Message broker that forwards tasks between Django and Celery.

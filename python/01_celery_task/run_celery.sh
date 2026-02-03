#!/bin/bash

celery -A main worker -l info

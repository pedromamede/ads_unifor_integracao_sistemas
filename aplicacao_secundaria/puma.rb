#!/usr/bin/env puma
# frozen_string_literal: true

threads_count = 1
threads threads_count, threads_count
port 3001
workers 0

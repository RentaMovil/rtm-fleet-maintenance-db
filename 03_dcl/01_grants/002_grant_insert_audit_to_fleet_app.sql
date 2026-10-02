-- fleet_app only appends to the audit log (shared.audit, created by rtm-iam-db): no SELECT,
-- UPDATE or DELETE, since audit is append-only and never read by the application.
GRANT INSERT ON shared.audit TO fleet_app;

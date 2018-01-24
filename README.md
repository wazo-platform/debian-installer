# Wazo debian-installer

## Execution order

GET /preseed.cfg
GET /installer.cfg  (from /preseed.cfg)
GET /standard_partitioning.cfg  (from /preseed.cfg)
GET /base.cfg  (from /preseed.cfg)
GET /pkg.cfg  (from /preseed.cfg)
GET /classes/*/custom.cfg  (from /preseed.cfg)

RUN /early_script  (installed from /preseed.cfg)
RUN /classes/*/early_script  (from /early_script)

RUN debian-installer

RUN /late_script  (installed from /preseed.cfg)
RUN /late_script_target  (from /late_script. Run inside `chroot /target`)
RUN /classes/*/late_script  (from /late_script)

REBOOT

RUN /etc/rc.local  (installed from /late_script)
RUN /postinst_script_launcher  (from /etc/rc.local)
RUN /postinst_script  (from /postinst_script_launcher)
RUN /classes/*/postinst_script  (from /postinst_script)

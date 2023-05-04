module.exports = {
  apps: [
    {
      name: "Travel-Backend",
      script: "npm",
      args: "run start:prod",
      env: {
        NODE_ENV: "production",
      },
      pmx: false,
      log_date_format: "YYYY-MM-DD HH:mm:ss",
      // error_file: './logs/error.log',
      // out_file: './logs/info.log',
    },
  ],
};

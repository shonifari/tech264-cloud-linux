# Azure Monitoring and Responding to Load/Traffic

## Code-Along Documentation

### Monitoring and Responding to Load/Traffic: Worst to Best

1. **Manual Monitoring**: Manually checking metrics and logs. This is the least efficient and most error-prone method.
2. **Basic Alerts**: Setting up basic alerts for specific metrics. This provides some automation but can still miss complex issues.
3. **Azure Monitor**: Using Azure Monitor to collect and analyze metrics and logs from all Azure resources. It provides a comprehensive view of system health.
4. **Application Insights**: Provides deeper insights into application performance and user behavior, allowing for proactive issue resolution.
5. **Automated Scaling**: Combining Azure Monitor with automated scaling to dynamically adjust resources based on load. This is the most efficient and responsive method.

### Setting Up a Dashboard

1. **Navigate to Azure Portal**: Go to the Azure portal and select "Dashboard" from the left-hand menu.
2. **Create New Dashboard**: Click on "New dashboard" and give it a name.
3. **Add Tiles**: Use the "Add tile" button to add various metrics, charts, and logs to your dashboard.
4. **Customize Layout**: Drag and drop tiles to customize the layout of your dashboard.
5. **Save and Share**: Save your dashboard and share it with your team if needed.

---

### How Load Testing and the Dashboard Helped Us

- **Load Testing**: Simulated high traffic to identify performance bottlenecks and ensure the system can handle peak loads.
- **Dashboard**: Provided real-time visibility into system performance, allowing us to quickly identify and address issues during load testing.

## Setting Up CPU Usage Alert

1. **Navigate to Azure Monitor**: Go to the Azure portal and select "Monitor" from the left-hand menu.
2. **Create Alert Rule**: Click on "Alerts" and then "New alert rule".
3. **Select Resource**: Choose the virtual machine you want to monitor.
4. **Configure Condition**: Set the condition to trigger when CPU usage exceeds a certain threshold (e.g., 75%).
5. **Define Action Group**: Create or select an action group to specify how you want to be notified (e.g., email, SMS).
6. **Create Alert**: Review and create the alert rule.

### Screenshot of Email Notification

![CPU Usage Alert Email](<../images/tech264 - Alerting email.png>)

For more detailed steps, you can refer to [Stephen Hackers' guide](https://www.stephenhackers.co.uk/azure-monitoring-alert-on-virtual-machine-cpu-usage/).

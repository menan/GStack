# GStack - Grid Stack View
Grid Stack View SwiftUI


Usage:

```
GStack(totalItems: dataStore.items.count, columns: 3, paddingBottom: 10, paddingRight: 5) { index in
    HubView(hub: self.dataStore.items[index])
}
```

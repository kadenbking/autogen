import React, { useState } from "react";
import { AuthProvider, useAuth } from "../auth/context";
import { getLocalStorage, setLocalStorage } from "../components/utils/utils";
import { User } from "../auth/api";

export interface AppContextType {
  darkMode: string;
  setDarkMode: any;
  user: User | null;
  setUser: any;
  logout: any;
  cookie_name: string;
}

export const appContext = React.createContext<AppContextType>(
  {} as AppContextType
);

const AppProvider = ({ children }: any) => {
  // Dark mode handling
  const storedValue = getLocalStorage("darkmode", false);
  const [darkMode, setDarkMode] = useState(
    storedValue === null ? "light" : storedValue === "dark" ? "dark" : "light"
  );

  const updateDarkMode = (darkMode: string) => {
    setDarkMode(darkMode);
    setLocalStorage("darkmode", darkMode, false);
  };

  // Modify logic here to add your own authentication
  const initUser = {
    name: "PTG Admin",
    email: "admin@paytechguide.com",
    username: "ptg_admin",
  };
  const [user, setUser] = useState<IUser | null>(initUser);

  return (
    <appContext.Provider
      value={{
        user,
        setUser: () => {},
        logout,
        cookie_name: "coral_app_cookie_",
        darkMode,
        setDarkMode: updateDarkMode,
      }}
    >
      {children}
    </appContext.Provider>
  );
};

// Combined provider that includes both Auth and App context
export default ({ element }: any) => (
  <AuthProvider>
    <AppProvider>{element}</AppProvider>
  </AuthProvider>
);

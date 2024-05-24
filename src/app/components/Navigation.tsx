import React from 'react';
import './Navigation.css';
import Link from 'next/link';
type NavigationProps = {
    currentUser: string;
};

const Navigation: React.FC<NavigationProps> = ({ currentUser }) => {
    return (
        <nav className="navigation">
            <ul className="flex min-w-screen flex-row navigation">
                <Link href="./home"><li>Home</li></Link>
                <li>About</li>
                <li>Contact</li>
            </ul>
            <div className="logo">Welcome, {currentUser}!</div>
        </nav>
    );
};

export default Navigation;
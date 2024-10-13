import React, { useState } from 'react';
import './Idea.css';

function Idea(props) {
    const key = props.key;
    const title = props.title;
    const author = props.author;
    const message = props.message;
    //const numLikes = props.likes;

    const [likes, setLikes] = useState(props.likes);

    return (
        <div className="row">
            <div className="drop">
                Placeholder
            </div>
            <div className="info">
                <div className="labels">
                    <div className="title">
                        <h3>{title}</h3>
                    </div>
                    <div className="author" >
                        <h4>{author}</h4>
                    </div>
                </div>
                <div className="likes">
                    <button type="button" className="like_button" onClick={() => setLikes(likes + 1)}>Like!</button>
                    <span className="like_count">{likes}</span>
                </div>
            </div>
        </div>
    );
}

export default Idea;

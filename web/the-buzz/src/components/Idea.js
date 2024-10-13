import React, { useState } from 'react';

function Idea(props) {
    const [likes, setLikes] = useState(props.likes);
    return (
        <div className="row">
            <div className="info">
                <div className="labels">
                    <div className="title">
                        <h3>{props.title}</h3>
                    </div>
                    <div className="author" >
                        <h4>{props.author}</h4>
                    </div>
                </div>
                <div className="likes">
                    <button type="button" onClick={() => setLikes(likes + 1)}>Like!</button>
                    <span>{likes}</span>
                </div>
            </div>
        </div>
    );
}

export default Idea;
